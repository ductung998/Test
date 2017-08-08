setwd("D:/Programming/Rstorage")

require(stringr)
require(data.table)

#danhsach.csv: danh mục thuốc bệnh viện da liễu cung cấp trên website được cắt ra chỉ còn hoạt chất và tên biệt dược
#dulieutho.csv: file dữ liệu thô được cắt ra chỉ còn tên biệt dược
danhsach <- read.csv("danhsach.csv", sep =",")
data <- read.csv("dulieutho.csv", sep = ",")[1]

danhsach1 <- list()
x <- data.frame()

for (i in 1:length(data[[1]])) {
  x[1,i] <- toString(tolower(data[[1]][i]))
}

x <- x[which(nchar(x)!=0)] #xóa phần dưới của file .csv chỉ chứa ""

#tách lấy chữ đầu trong danh mục thuốc bv (đa số là tên biệt dược) tạo danh sách đối chiếu
for (i in 1:length(danhsach[[1]])){
  danhsach1[i] <- tolower(danhsach[[2]][i])
  danhsach1[i] <- strsplit(danhsach1[[i]][1], " ")[[1]][1]
}

#tách chữ đầu trong data x, tìm trong danh sách đối chiếu
#nếu có, lấy tên hoạt chất từ số thứ tự đó trong danh sách, thêm vào cột 2 của x
#đồng thời tách lấy chữ cuối (đa số là hàm lượng) thêm vào cột 3 của x
#nếu không có, thêm chữ delete vào cột 2
i <- 1

while (i < length(x)) {
  if (length(danhsach[[1]][which(danhsach1 == strsplit(x[1,i], " ")[[1]][1])]) == 1) {
    x[2,i] <- toString(danhsach[[1]][which(danhsach1 == strsplit(x[1,i], " ")[[1]][1])]) 
    x[3,i] <- strsplit(x[1,i], " ")[[1]][length(strsplit(x[1,i], " ")[[1]])]
    i <- i + 1
  }
  else {
    x[2,i] <- "delete"
    i <- i + 1
  }
}

y <- transpose(x)

write.csv(y, file ="xuat.csv")

#kết quả: đc 1 file csv chứa hoạt chất + hàm lượng ứng với biệt dược
#với các thuốc không tra cứu được sẽ bị xóa bằng tay trong file dữ liệu gốc qua chữ "delete"
