#include "audio_filter.hpp"
#include "test_model.hpp"
#include <cassert>
#include <iostream>
#include <random>

int main() {
    hls::stream<audio_axis_t> input("input"), output("output");
    Reference model;
    std::mt19937 rng(1761);
    for (unsigned n = 0; n < 4096; ++n) {
        audio_axis_t in;
        const unsigned id = n % 8;
        const bool bypass = (n % 19) < 3;
        const std::uint32_t word = n < 128 ?
            make_word((id & 1) ? -8388608 : 8388607, (id & 1) ? 3 : 2) : rng();
        in.data = word;
        in.id = id;
        input.write(in);
        audio_filter_hls(input, output, bypass);
        assert(!output.empty());
        audio_axis_t out = output.read();
        assert(out.id.to_uint() == id);
        const std::uint32_t expected = model.process(word, id, bypass);
        const std::uint32_t actual = out.data.to_uint();
        if (actual != expected || out.id.to_uint() != id) {
            std::cerr << "Mismatch at sample " << n
                      << ", channel=" << id << ", bypass=" << bypass
                      << std::hex << "\nInput: 0x" << word
                      << "\nExpected: 0x" << expected
                      << "\nActual: 0x" << actual << std::dec << std::endl;
            return 1;
        }
        assert(output.empty());
    }
    std::cout << "PASS: HLS stream C simulation, 4096 words\n";
}
