module CRC32
  def crc32 c
    r = 0xFFFFFFFF
    c.each_byte do |b|
        r ^= b
        8.times do
          r = (r>>1) ^ (0xEDB88320 * (r & 1))
        end
    end
    r ^ 0xFFFFFFFF
  end
end
