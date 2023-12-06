// params.input_folder = ""
// input_ch = channel.from(params.input) 
params.label = "run"
params.samples = ""
params.bams = ""
params.barecodes = ""
params.gmap = ""
params.snpvcs = ""
params.paneldir = ""
params.outdir = "."
params.ncores = ""

process step1{
    input: 
        val label
        val samples
        path bams
        path barecodes
        path gmap
        path snpvcs
        path paneldir
        path outdir
        val ncores

    output:
        path "${outdir}"
    publishDir "index", mode: "copy"

    shell:
    '''
    pileup_and_phase.R --label !{label} --samples !{samples} --bams !{bams} --barcodes !{barecodes} --gmap !{gmap} --snpvcf !{snpvcs} --paneldir !{paneldir} --outdir !{outdir} --ncores !{ncores}
    '''

}

workflow {
   step1(params.label, params.samples, params.bams, params.barecodes, params.gmap, params.snpvcs, params.paneldir, params.outdir, params.ncores = "")
}