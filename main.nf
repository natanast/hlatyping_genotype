nextflow.enable.dsl=2

// Include the modules for ARCASHLA extract and genotype
include { ARCASHLA_EXTRACT } from './modules/nf-core/extract/main.nf'
// include { HLAGENOTYPE } from './modules/nf-core/hlagenotype'

// Define your input BAM file
bam_file = file('/dataset/test.bam')

// Define the output directory
output_dir = '/dataset/test/output'

// Define the alleles for genotyping
// alleles = 'A,B,C,DPB1,DQB1,DQA1,DRB1'

workflow {
    // Extract reads from BAM file
    extracted_reads = ARCASHLA_EXTRACT(meta: [ id: 'sample1' ], bam: bam_file)

    // Pass extracted reads to genotyping
    // HLAGENOTYPE(meta: extracted_reads[0], fastq: extracted_reads[1])
}
