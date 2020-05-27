# JBrowse

#
# This docker file uses multistage builds, where the first stage (named 'build')
# gets lots of prereqs, checks out git repos and runs the setup script. The
# resulting image is over 2GB and can be deleted after building. The second
# stage (called 'production') then copies files from the first stage and
# results in a image that is just over 100MB.
#
# Also, note the change to the initial parent image: there is now a jbrowse-buildenv
# image at docker hub
#

FROM gmod/jbrowse-buildenv:latest as build

RUN git clone --single-branch --branch sars-specific https://github.com/GMOD/jbrowse.git
#RUN git clone --single-branch --branch dev https://github.com/GMOD/jbrowse.git
RUN git clone https://github.com/gmod/sars-cov-2-jbrowse.git 
RUN git clone https://github.com/bhofmei/jbplugin-screenshot.git
RUN git clone https://github.com/scottcain/colorbycds.git
RUN git clone https://github.com/twsaari/FeatureSequence.git
RUN git clone https://github.com/cmdcolin/mafviewer.git
RUN git clone --single-branch --branch agr-release-3.0.0 https://github.com/WormBase/website-genome-browsers.git

#no longer need to fetch vcf files
#WORKDIR /agr_jbrowse_config/scripts
#RUN ./fetch_vcf.sh jbrowse

RUN mkdir /usr/share/nginx/html/jbrowse

RUN rm /usr/share/nginx/html/index.html && rm /usr/share/nginx/html/50x.html && cp -r /jbrowse/* /usr/share/nginx/html/jbrowse && \
    cp sars-cov-2-jbrowse/index.html /usr/share/nginx/html/index.html && \
    cp /jbrowse/.htaccess /usr/share/nginx/html/jbrowse/.htaccess && \
    cp /sars-cov-2-jbrowse/jbrowse/jbrowse.conf /usr/share/nginx/html/jbrowse && \
    cp -r /sars-cov-2-jbrowse/jbrowse/data /usr/share/nginx/html/jbrowse && \
    cp -r /jbplugin-screenshot /usr/share/nginx/html/jbrowse/plugins/ScreenShotPlugin && \
    cp -r /colorbycds /usr/share/nginx/html/jbrowse/plugins/ColorByCDS && \
    cp -r /FeatureSequence /usr/share/nginx/html/jbrowse/plugins/FeatureSequence && \
    cp -r /mafviewer /usr/share/nginx/html/jbrowse/plugins/MAFViewer && \
    cp -r /website-genome-browsers/jbrowse/jbrowse/plugins/wormbase-glyphs /usr/share/nginx/html/jbrowse/plugins

WORKDIR /usr/share/nginx/html/jbrowse

#RUN npm install yarn
#RUN ./node_modules/.bin/yarn
#RUN JBROWSE_BUILD_MIN=1 ./node_modules/.bin/yarn build

RUN ./setup.sh -f

FROM nginx:latest as production

COPY --from=build /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html
COPY --from=build /usr/share/nginx/html/jbrowse/dist /usr/share/nginx/html/jbrowse/dist
COPY --from=build /usr/share/nginx/html/jbrowse/browser /usr/share/nginx/html/jbrowse/browser
COPY --from=build /usr/share/nginx/html/jbrowse/css /usr/share/nginx/html/jbrowse/css
COPY --from=build /usr/share/nginx/html/jbrowse/data /usr/share/nginx/html/jbrowse/data
COPY --from=build /usr/share/nginx/html/jbrowse/img /usr/share/nginx/html/jbrowse/img
COPY --from=build /usr/share/nginx/html/jbrowse/index.html /usr/share/nginx/html/jbrowse/index.html
COPY --from=build /usr/share/nginx/html/jbrowse/jbrowse_conf.json /usr/share/nginx/html/jbrowse/jbrowse_conf.json
COPY --from=build /usr/share/nginx/html/jbrowse/jbrowse.conf /usr/share/nginx/html/jbrowse/jbrowse.conf
COPY --from=build /usr/share/nginx/html/jbrowse/LICENSE /usr/share/nginx/html/jbrowse/LICENSE
COPY --from=build /usr/share/nginx/html/jbrowse/plugins /usr/share/nginx/html/jbrowse/plugins
COPY --from=build /usr/share/nginx/html/jbrowse/site.webmanifest /usr/share/nginx/html/jbrowse/site.webmanifest
COPY --from=build /usr/share/nginx/html/jbrowse/.htaccess /usr/share/nginx/html/jbrowse/.htaccess

VOLUME /data
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
