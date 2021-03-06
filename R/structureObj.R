#' @title Topic model fitting and Structure Plot!
#'
#' @param data counts data, with samples along the rows and features along the columns.
#' @param nclus_vec the vector of clusters or topics to be fitted.
#' @param samp_metadata the sample metadata, samples along the rows and each column representing some metadata information
#'        that will be used to arrange the Structure plot columns (one plot for one arrangement).
#' @param tol the tolerance value for topic model fit (set to 0.001 as default)
#' @param batch_lab the batch labels, the output will have one Structure plot arranged by batch labels too.
#' @param path The directory path where we want to save the data and Structure plots.
#' @param partition A logical vector of same length as metadata. partition[i]=TRUE will imply that for the Structure
#'            plot for i th metadata, no vertical line parititon between classes is used.
#' @param plot TRUE or FALSE. To make the Structure plots or not.
#' @param control() A list of control parameters for the Structure plot. The control list has the arguments
#'        struct.width, struct.height, cex.axis, cex.main, las.struct, lwd, las and color and margin parameters.
#'
#' @description This function takes the counts data (no. of samples x no. of features) and the value of K, the number of topics or
#' cluster to fit, along with sample metadata information and fits the topic model (due to Matt Taddy, check package
#' maptpx) and outputs the Structure plot with the column bars in
#' Structure plot arranged as per the sample metadata information.
#'
#' @author Kushal K Dey, Matt Taddy, Matthew Stephens, Ida Moltke
#'
#' @references Matt Taddy.On Estimation and Selection for Topic Models. AISTATS 2012, JMLR W\&CP 22.
#'
#'            Pritchard, Jonathan K., Matthew Stephens, and Peter Donnelly. Inference of population structure using multilocus genotype data.
#'            Genetics 155.2 (2000): 945-959.
#' @keywords counts data, clustering, Structure plot
#'
#' @export
#'



StructureObj <- function(data, nclus_vec, samp_metadata, tol, batch_lab, path_rda, path_struct,
                         partition=rep('TRUE',ncol(samp_metadata)), plot = TRUE,
                         control=list())
{

  control.default <- list(struct.width=600, struct.height=400, cex.axis=0.5, cex.main=1.5, las=2, lwd=2,
                          mar.bottom =14, mar.left=2, mar.top=2, mar.right=2,color=2:(length(nclus_vec)+1));

  namc=names(control)
  if (!all(namc %in% names(control.default)))
    stop("unknown names in control: ", namc[!(namc %in% names(control.default))])
  control=modifyList(control.default, control)

  ## dealing with blank rows: we first remove them

  indices_blank <- as.numeric(which(apply(data,1,max)==0));
  if(length(indices_blank)!=0){
  data <- as.matrix(data[-indices_blank,]);
  samp_metadata <- as.matrix(samp_metadata[-indices_blank,]);
  batch_lab <- as.vector(batch_lab[-indices_blank]);
  }

  message('Fitting the topic model (due to Matt Taddy)', domain = NULL, appendLF = TRUE)

  Topic_clus_list <- lapply(nclus_vec, function(per_clust) {
    maptpx::topics(data, K = per_clust, tol=tol)
  })

  names(Topic_clus_list) <- paste0("clust_",nclus_vec)
  save(Topic_clus_list, file = path_rda);

  num_metadata <- dim(samp_metadata)[2];

  if(plot) {
  message('Creating the Structure plots', domain = NULL, appendLF = TRUE)
  for(num in 1:length(nclus_vec))
  {
       StructureObj_omega(Topic_clus_list[[num]]$omega,samp_metadata, batch_lab, path_struct,
                            partition=partition,
                            control=control)
  }}
}
