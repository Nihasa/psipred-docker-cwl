#!/usr/bin/env cwltool
cwlVersion: v1.0
class: CommandLineTool
label: runpsipredplus
doc: |-
  Usage: 
  cwltool --singularity psipred_run.cwl --blast_db_files=<BLASTDB_FOLDER> --blast_db_name=<BLASTDB_NAME> --fasta_in=<SAMPLES_FASTA>

requirements:
- class: DockerRequirement
  dockerPull: reg.fungalgenomics.ca/psipred:4.02
- class: InitialWorkDirRequirement
  listing: 
  - $(inputs.blast_db_files.listing)
- class: EnvVarRequirement
  envDef: 
    BLASTDB: $(inputs.blast_db_name)
    THREADS: $(inputs.threads)

inputs:
  fasta_in:
    doc: |-
      The fasta containing the sequences to evaluate.
    type: File
    inputBinding:
      position: 1
  blast_db_files:
    doc: |-
      The directory containing your blast database files.
    type: Directory
  blast_db_name:
    doc: |-
      The name of your blast database.
    type: string
  threads:
    doc: |-
      The number of parallel iterations for psi-blast.
    type: int
    default: 4

outputs:
  log: 
    type: stdout
  err: 
    type: stderr
  ss2:
    type: File
    outputBinding:
      glob: ['*.ss2']
  horiz:
    type: File
    outputBinding:
      glob: ['*.horiz']

stdout: psipred.log
stderr: psipred.err

baseCommand: /psipred/runpsipredplus