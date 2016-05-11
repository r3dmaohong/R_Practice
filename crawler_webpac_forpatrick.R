library(rvest)

trim <- function (x) gsub("^\\s+|\\s+$", "", x)

n='�O�۫H����H'
tmp_url='http://webpac.tphcc.gov.tw/toread/opac/search?q='

url = paste0(tmp_url,n)
total_css = read_html(url)
content_css = total_css %>% html_nodes("li") %>% html_text()
content_css = iconv(content_css,'utf8')
content_css  = gsub('\n','',content_css)
content_css  = gsub('\r','',content_css)
content_css = trim(content_css)

catch_ISBN = content_css[(which(grepl('ISBN',content_css))[1]+1):(length(content_css))]

export_df = data.frame('�W��'=character(),'ISBN'=character(),'�X���~'=character(),'�]�åU��'=character())
x=1

export_df[x,] = c(n,catch_ISBN[which(grepl('ISBN',catch_ISBN))],catch_ISBN[which(grepl('�X���~',catch_ISBN))],catch_ISBN[which(grepl('�]�ìy�q���A',catch_ISBN))])


export_df$ISBN = trim(gsub('ISBN:','',export_df$ISBN))
export_df$�X���~ = trim(gsub('�X���~:','',export_df$�X���~))
export_df$�]�åU�� = trim(gsub('�]�ìy�q���A:','',export_df$�]�åU��))
for(i in 1:nrow(export_df)){
  export_df$�]�åU��[i] = substr(export_df$�]�åU��[i],1,unlist(gregexpr(pattern ='�]��',export_df$�]�åU��[i]))[1]-1)
}