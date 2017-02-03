FROM vault:0.6.4
MAINTAINER blockloop <blockloop@users.noreply.github.com>
ADD run.sh /run.sh
RUN ["chmod", "+x", "/run.sh"]
CMD ["/run.sh"]
