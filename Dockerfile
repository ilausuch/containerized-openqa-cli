FROM opensuse/leap

RUN source /etc/os-release && \
	zypper addrepo -G -cfp 91 https://download.opensuse.org/repositories/devel:/openQA:/Leap:/$VERSION/openSUSE_Leap_$VERSION devel-openQA-Leap
RUN zypper in -y openQA-client
RUN mkdir /etc/openqa
RUN git clone https://github.com/os-autoinst/scripts.git
COPY client.conf.tmp /etc/openqa/client.conf
