
Flowers <- readLines("LoFlowers.txt",encoding = "UTF-8")
month <- grep(".月$",Flowers)
garden <- grep(".月.*日",Flowers)
garden <- paste0(Flowers[garden],ifelse(grepl("\\(|\\)",Flowers[garden]),""," ()"))
day <- sub("(.月.{1,2}日).*", "\\1",garden)
flower <- sub(".*\\s(.*)\\s\\(.*", "\\1",garden)
name <- sub(".*\\((.*)\\)$", "\\1",garden)
#ifelse(grepl("\\d+",name),NA,name)

whisper <- grep("花语",Flowers)
divine <-  grep("花占卜",Flowers)
maxim <-   grep("花箴言",Flowers)
whisper <- sub(".*\\s+[:﹕]+\\s(.*)$","\\1",Flowers[whisper])
divine <- sub(".*\\s+[:﹕]+\\s(.*)$","\\1",Flowers[divine])
maxim <- sub(".*\\s+[:﹕]+\\s(.*)$","\\1",Flowers[maxim])

Flowers <- data.frame(month=rep(Flowers[month],c(31,29,31,30,31,30,31,31,30,31,30,31)),
                      day=day, flower=flower,name=name,whisper=whisper,
                      divine=divine,maxim=maxim)

write.table(Flowers,"iFlowers.txt",sep="\t",row.names=F)
