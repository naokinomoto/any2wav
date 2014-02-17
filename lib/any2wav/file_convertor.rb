# -*- coding: utf-8 -*-

module Any2wav
  class FileConvertor
    def convert(src_file_name, dst_file_name)
      buffer = File.open(src_file_name, "rb")
      wav = Wav.new(buffer)
      wav.write(dst_file_name)
    end
  end
end

