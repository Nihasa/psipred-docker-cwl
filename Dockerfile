FROM ubuntu:22.04 AS shell

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl

RUN curl http://bioinfadmin.cs.ucl.ac.uk/downloads/psipred/psipred.4.02.tar.gz -o psipred.4.02.tar.gz

RUN apt-get install -y tcsh
RUN apt-get install -y make make-doc
RUN apt-get install -y ncbi-blast+
RUN apt-get install -y ncbi-blast+-legacy
RUN apt-get install -y build-essential
RUN apt-get install -y manpages-dev

RUN tar -xvf psipred.4.02.tar.gz
RUN rm psipred.4.02.tar.gz
RUN ln -s /bin/blastpgp /usr/local/bin/blastpgp 
RUN ln -s /bin/psiblast /usr/local/bin/psiblast
ENTRYPOINT ["/usr/bin/tcsh"]

FROM shell

SHELL ["/bin/tcsh", "-c"]
WORKDIR /psipred/src
RUN make 
RUN make install
WORKDIR /psipred
COPY ./psipred_runners/* /psipred/
RUN chmod -R a+x /psipred/*
RUN chmod -R a+r /psipred/*
ENV PATH="/psipred/:$PATH"
# ## TESTING ## TO MOVE TO ANOTHER PLACE ## 
# RUN curl https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz -o swissprot.fasta.gz
# RUN gunzip swissprot.fasta.gz
# RUN makeblastdb -in swissprot.fasta -input_type fasta -dbtype prot -title swissprot -parse_seqids -out swissprot
# ENV BLASTDB=swissprot
# RUN ./runpsipred /psipred/example/example.fasta 
# RUN ./runpsipredplus example/example.fasta 

# Build commands
# docker build --no-cache --force-rm -t reg.fungalgenomics.ca/psipred:4.02 -t reg.fungalgenomics.ca/psipred:latest .
# docker build --force-rm -t reg.fungalgenomics.ca/psipred:4.02 -t reg.fungalgenomics.ca/psipred:latest .
# docker push reg.fungalgenomics.ca/psipred:latest
# docker push reg.fungalgenomics.ca/psipred:4.02 
