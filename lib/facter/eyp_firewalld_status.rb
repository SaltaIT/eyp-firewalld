retcode = Facter::Util::Resolution.exec('bash -c \'/usr/bin/systemctl status firewalld >/dev/null 2>&1; echo $?\'').to_s

unless retcode.nil? or retcode.empty?
  Facter.add('eyp_firewalld_status') do
      setcode do
        retcode
      end
  end
end
