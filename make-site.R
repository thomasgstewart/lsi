require(tgsify)

make_index <- function(){
  
  posts <- list.files(pattern = "^[0-9]{4}-[0-9]{2}-[0-9]{2}.*\\.Rmd")
  locs <- gsub("\\.Rmd$",".html", posts)
  titles <- dates <- rep(NA, length(posts))
  for(i in 1:length(posts)){
    titles[i] <- readLines(con = "./" %|% posts[i], n = 2) %>% 
      ve(2) %>% 
      gsub("title: ", "", .)
    dates[i] <- posts[i] %>% substr(1,10)
  }
  
  
  head <- "---\ntitle: Posts\n---\n\n"
  body <- "- [" %|% titles %|% "](" %|% locs %|% ")\n"
  cat(head, body, sep = "", file = "index.Rmd")
}

make_index()

rmarkdown::render_site()
