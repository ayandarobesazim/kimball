module GsmHelper
  # Returns a new string in GSM 03.38 encoding
  def to_gsm0338(message)
    # Replace bad characters with GSM allowed ones
    map = 
    { 
      "“" => "\"",
      "”" => "\"", 
      "—" => "-",
      "’" => "'"
    }
    re = Regexp.new(map.keys.map { |x| Regexp.escape(x) }.join('|'))
    
      message_clean = message.gsub(re, map)
    if message_clean.present?
    # Run resulting string though GSMEncoder. Replace any remaining bad characters with a space.
      message_clean = GSMEncoder.encode(message_clean, ' ')
    end
    return message_clean
  end

end