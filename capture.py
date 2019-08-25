import pyshark as ps
import sys

outputpath = "./captures"

def capture():
	print("capturing at address " + ip_addr + " into capture" + fileNumber + "-" + fileSubNumber + ".pcap....")
	capture = ps.LiveCapture(interface = "eth0", output_file = outputpath + "/capture" + fileNumber + "-" + fileSubNumber + ".pcap", display_filter = 'ip.dst==' + ip_addr)
	capture.sniff(timeout = timeout)

if __name__ == "__main__" :
	ip_addr = sys.argv[1]
	fileNumber = sys.argv[2]
	fileSubNumber = sys.argv[3]
	timeout = int(sys.argv[4])
	capture()