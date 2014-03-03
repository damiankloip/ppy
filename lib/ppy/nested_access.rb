
class Hash

  def nested_access(path, seperator = '.')
    ret = self
    path.to_s.split(seperator).each do |p|
      if p.to_i.to_s == p
        ret = ret[p.to_i]
      elsif !ret[p.to_s].nil?
        ret = ret[p.to_s]
      elsif !ret[p.to_sym].nil?
        ret = ret[p.to_sym]
      else
        ret = nil
      end
      break unless ret
    end

    ret
  end

end
