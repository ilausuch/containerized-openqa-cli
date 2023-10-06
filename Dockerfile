#FROM opensuse/tumbleweed
FROM opensuse/leap

RUN zypper addrepo -G -cfp 91 https://download.opensuse.org/repositories/devel:/openQA:/Leap:/15.2/openSUSE_Leap_15.2 devel-openQA-Leap
RUN zypper in -y openQA-devel os-autoinst-distri-opensuse-deps
RUN mkdir /etc/openqa
RUN git clone https://github.com/os-autoinst/scripts.git

# COPY entrypoint.sh /
# RUN chmod a+x /entrypoint.sh
# 
# ENTRYPOINT [ "/entrypoint.sh" ]
