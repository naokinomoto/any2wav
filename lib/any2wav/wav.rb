# -*- coding: utf-8 -*-

module Any2wav
  class Wav
    def initialize(buffer)
      @buffer = buffer
      @samples_per_sec = 44100
      @bits_per_sample = 16
      @channel = 2
      @block_size = @channel * 2
      @size = @buffer.size
      @bytes_per_sec = @samples_per_sec * @block_size
      @chunk_size = 16
      @wave_format_type = 1
    end

    def write(file_name)
      header =
        "RIFF" +
        [@size + 36].pack("L*") +
        "WAVE" +
        "fmt " +
        [@chunk_size].pack("L*") +
        [@wave_format_type].pack("S*") +
        [@channel].pack("S*") +
        [@samples_per_sec].pack("L*") +
        [@bytes_per_sec].pack("L*") +
        [@block_size].pack("S*") +
        [@bits_per_sample].pack("S*") +
        "data" +
        [@size].pack("L*")

      File::open(file_name, "wb") do |f|
        f.write(header)
        @buffer.each do |b|
          f.write(b)
        end
      end
    end
  end
end
