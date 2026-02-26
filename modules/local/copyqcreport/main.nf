process COPY_QC_REPORT {
    tag "${meta.id}"
    label 'process_low'

    publishDir path: { "${params.report_dir}" }, mode: 'copy', saveAs: { meta.id ? "qc_downstream_${meta.id}.html" : "qc_downstream.html" }

    input:
    tuple val(meta), path(qc_html)

    output:
    tuple val(meta), path("qc_downstream.html"), emit: report

    script:
    """
    cp ${qc_html} qc_downstream.html
    """
}
