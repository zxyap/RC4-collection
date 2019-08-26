import scapy.all as sc
import sys

def capture():
	full_file_name = "./captures/capture" + fileNumber + '-' + fileSubNumber
	print('capturing at ' + ip_addr + ' into ' + full_file_name + "...")
	packets = sc.sniff(iface = 'eth0', filter = 'host ' + ip_addr, timeout=timeout)
	if(len(packets) == 0):
		print('no packets captured, not saving to pcap file.')
	else:
		sc.wrpcap(full_file_name, packets)

if __name__ == "__main__" :
	ip_addr = sys.argv[1]
	fileNumber = sys.argv[2]
	fileSubNumber = sys.argv[3]
	timeout = int(sys.argv[4])
	capture()