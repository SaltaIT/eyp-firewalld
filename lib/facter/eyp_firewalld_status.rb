retcode = Facter::Util::Resolution.exec('/usr/bin/systemctl status firewalld >/dev/null 2>&1; echo $?').to_s

unless env.nil? or env.empty?
  Facter.add('eyp_firewalld_status') do
      setcode do
        retcode
      end
  end
end
