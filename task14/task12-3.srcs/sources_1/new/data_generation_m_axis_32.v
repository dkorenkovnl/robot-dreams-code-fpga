`timescale 1ns / 1ps

`default_nettype none

// Single-clock AXI4-Stream test source: 60,000 bytes per frame.
// start must be synchronous to aclk. Pulse it for one cycle while !busy.
// aresetn may assert asynchronously; release it synchronously to aclk.
// Byte pattern: 00, 01, ... FF, 00, ... (low byte transmitted first).
`timescale 1ns / 1ps

`default_nettype none

// Single-clock AXI4-Stream test source: 60,000 bytes per frame.
// start must be synchronous to aclk. Pulse it for one cycle while !busy.
// aresetn may assert asynchronously; release it synchronously to aclk.
// Byte pattern: 00, 01, ... FF, 00, ... (low byte transmitted first).
module data_generation_m_axis_32 (
    input  wire        aclk,
    input  wire        aresetn,
    input  wire        start,
    output wire        busy,
    output reg         done,
    output wire [31:0] m_axis_tdata,
    output wire [3:0]  m_axis_tkeep,
    output wire [3:0]  m_axis_tstrb,
    output wire        m_axis_tvalid,
    input  wire        m_axis_tready,
    output wire        m_axis_tlast
);
    localparam [13:0] LAST_BEAT = 14'd14999;

    reg        transmitting;
    reg [13:0] beat_index;
    reg [7:0]  byte_base;

    wire [7:0] byte1 = byte_base + 8'd1;
    wire [7:0] byte2 = byte_base + 8'd2;
    wire [7:0] byte3 = byte_base + 8'd3;

    assign busy          = !aresetn || transmitting;
    assign m_axis_tdata  = {byte3, byte2, byte1, byte_base};
    assign m_axis_tkeep  = 4'b1111;
    assign m_axis_tstrb  = 4'b1111;
    assign m_axis_tvalid = transmitting && aresetn;
    assign m_axis_tlast  = m_axis_tvalid && (beat_index == LAST_BEAT);

    wire transfer = m_axis_tvalid && m_axis_tready;
    
    
    // code added begin
    (* ASYNC_REG = "TRUE" *) reg [1:0] start_sync;
    reg start_previous;
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            start_sync     <= 2'b00;
            start_previous <= 1'b0;
        end else begin
            start_sync     <= {start_sync[0], start};
            start_previous <= start_sync[1];
        end
    end
    wire start_pulse = start_sync[1] && !start_previous;
    // code added end

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            transmitting <= 1'b0;
            beat_index   <= 14'd0;
            byte_base    <= 8'd0;
            done         <= 1'b0;
        end else begin
            done <= 1'b0;

            //if (start && !busy) begin
            // since start is comming to us from 100MHz CD 
            //we have to add code above
            if (start_pulse && !busy) 
            begin
                transmitting <= 1'b1;
                beat_index   <= 14'd0;
                byte_base    <= 8'd0;
            end else if (transfer) begin
                if (beat_index == LAST_BEAT) begin
                    transmitting <= 1'b0;
                    done         <= 1'b1;
                end else begin
                    beat_index <= beat_index + 14'd1;
                    byte_base  <= byte_base + 8'd4;
                end
            end
        end
    end
endmodule

`default_nettype wire