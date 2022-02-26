@load frameworks/intel/seen

module dportmatch;

redef record Intel::MetaData += {
	dport: port &optional;
};

export {
  redef enum Notice::Type += {
    DPORT_INTEL_MATCH,
  };
}

event Intel::match(s: Intel::Seen, items: set [Intel::Item]) {
local port_list: set[port];
	for (i in items) {
		if (i$meta?$dport) {
			if (i$meta$dport == s$conn$id$resp_p) {
				local msg = fmt("Indicator %s matched with dport %s from source %s", i$indicator, i$meta$dport, i$meta$source);
				NOTICE([$note=DPORT_INTEL_MATCH, $msg=msg, $conn=s$conn, $sub="dport match detected"]); 
			}
		}
	}
}