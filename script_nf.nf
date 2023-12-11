// input_ch  channel.from(params.input) 
params.label = "run_default"
params.samples = "name1"
params.bams = 'default.bam'
params.barecodes = null
params.gmap = "test.txt.gz" //TO_FIND
params.snpvcs = "x" //TO_FIND
params.paneldir = "x" //TO_FIND
params.outdir = "/res_default"
params.ncores = "1"
params.folder1 = '/chemin/par/defaut/pour/folder1' // Remplacez par un chemin par défaut approprié
params.file_bam = '/chemin/par/defaut/pour/file.bam' // Remplacez par un chemin de fichier BAM par défaut
params.help = null


process step1{
    // input: 
        /*val label
        val samples
        path bams
        path barecodes
        path gmap
        path snpvcs
        path paneldir
        path outdir
        val ncores
        */
    // output:
    
    //     path "!{outdir}"
    // publishDir "index", mode: "copy"

    script:
    if (params.help) {
    """
    Rscript ../../../bin/pileup_and_phase.R --help 
    """//FIND A WAY TO PRINT
    }
    else {
    """
    Rscript ../../../bin/pileup_and_phase.R --label $params.label --samples $params.samples --bams $params.bams --barcodes $params.barecodes --gmap $params.gmap --snpvcf $params.snpvcs --paneldir $params.paneldir --outdir $params.outdir --ncores $params.ncores
    """}
}

workflow{step1()}
/*workflow {
   step1(params.label, params.samples, params.bams, params.barecodes, params.gmap, params.snpvcs, params.paneldir, params.outdir, params.ncores = "")
}*/
