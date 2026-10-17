`timescale 1ns / 1ps
`default_nettype none

// VER 1
// Single-clock AXI4-Stream test source: 60,000 bytes per frame.
// start must be synchronous to aclk. Pulse it for one cycle while !busy.
// aresetn may assert asynchronously; release it synchronously to aclk.
// Byte pattern: 00, 01, ... FF, 00, ... (low byte transmitted first).
// since we are generating 32bits the counter LAST_BEAT = 14'd14999

// VER 2 (current one)
// it were added two inputs use_template,byte_base_in
// to give the opportunity to use data_generation_m_axis_32_v2 in two modes 
// - data generator based on template 
// - get data from outside

module data_generation_m_axis_32_v2 (
    input  wire        aclk,
    input  wire        aresetn,
    input  wire        start,
    
    //new inputs to following the task requerments
    input  wire        use_template,
    input  wire [7:0]  byte_base_in,

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
    reg        template_mode;
    reg [13:0] beat_index;
    reg [7:0]  byte_base;

    wire [7:0] byte1 = byte_base + 8'd1;
    wire [7:0] byte2 = byte_base + 8'd2;
    wire [7:0] byte3 = byte_base + 8'd3;

    assign busy          = !aresetn || transmitting;
    assign m_axis_tdata   = {byte3, byte2, byte1, byte_base};
    assign m_axis_tkeep   = 4'b1111;
    assign m_axis_tstrb   = 4'b1111;
    assign m_axis_tvalid = transmitting && aresetn;
    assign m_axis_tlast  = m_axis_tvalid &&
                           (beat_index == LAST_BEAT);

    wire transfer = m_axis_tvalid && m_axis_tready;

    // Synchronize the start level into the aclk domain.
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

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            transmitting <= 1'b0;
            template_mode <= 1'b1;
            beat_index   <= 14'd0;
            byte_base    <= 8'd0;
            done         <= 1'b0;
        end else begin
            done <= 1'b0;

            if (start_pulse && !busy) begin
                transmitting <= 1'b1;
                template_mode <= use_template;
                beat_index   <= 14'd0;

                // Prepare the first output word.
                byte_base <= use_template ? 8'd0 : byte_base_in;

            end else if (transfer) begin
                if (beat_index == LAST_BEAT) begin
                    transmitting <= 1'b0;
                    done         <= 1'b1;
                end else begin
                    beat_index <= beat_index + 14'd1;

                    // Prepare the next output word.
                    if (template_mode)
                        byte_base <= byte_base + 8'd4;
                    else
                        byte_base <= byte_base_in;
                end
            end
            // Without a transfer, hold the current word unchanged.
        end
    end

endmodule

`default_nettype wire
