class Print < ApplicationController
  def self.to_file(obj)
    File.open(File.join("tmp", "logs", Time.now.to_s[0, 19].to_s + '.rb'), 'w') { |file| file.write(obj) }
  end

  def self.ppp(obj)
    p "*" * 50
    pp obj
    p "*" * 50
  end
end
