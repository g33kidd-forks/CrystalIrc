require "./client"

module CrystalIrc
  class Message

    @source     : String?
    @command    : String
    @arguments  : String?
    @client     : CrystalIrc::Client

    getter source, command, arguments

    def initialize(raw : String, @client)
      m = raw.match(/\A(\:(?<source>[^[:space:]]+) )?(?<cmd>[A-Z]+)(?: (?<args>.*))?\Z/)
      raise InvalidMessage.new("Cannot parse the message \"#{raw}\"") if m.nil?
      @source = m["source"]?
      @command = m["cmd"] #? || raise InvalidMessage.new("No command to parse in \"#{raw}\"")
      @arguments = m["args"]?
    end

  end
end
