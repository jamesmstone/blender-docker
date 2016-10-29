
FROM	alpine:latest
LABEL	authors	"Isaac \"Ike\" Arias <ikester@gmail.com>,James Stone"

RUN	apk add --no-cache \
	--update \
	curl \
	tar \
	bzip2 \
	freetype \
	mesa-dev \
	mesa \
	libxi

ENV BLENDER_MAJOR 2.78
ENV BLENDER_VERSION 2.78a
ENV BLENDER_BZ2_URL http://ftp.halifax.rwth-aachen.de/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc211-x86_64.tar.bz2

RUN	mkdir /usr/local/blender \
	&& curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 \
	&& tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 \
	&& rm blender.tar.bz2 \
	&& apk del curl


VOLUME	/media
ENTRYPOINT	["/usr/local/blender/blender","-b"]
