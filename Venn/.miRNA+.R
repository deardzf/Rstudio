#R包安装
for (i in c("venn", "dplyr", "ggsci", "tibble", "UpSetR", "ggplot2", 
            "stringi", "progress", "magrittr", "data.table")) {
  if (!requireNamespace(i, quietly = TRUE)) {
    install.packages(i, update = FALSE)
  }
};rm(i)

source('./data/.venn_P+.R')

#已设置默认参数，直接运行函数即可
wheremytargets()
myvenn()
myupset()
mynetwork()

#参数
wheremytargets(input = ".miR.txt", database = "all") 
               #数据库，名字请对应，"all"即为默认data文件夹下所有数据库
myvenn(input = ".miR.txt", database = "recommend", n = 7, 
       #默认为预测数量最多的前n个数据库，也可根据table.xls手动填入数据库名,格式为c("","","",)
       mycol = pal_npg("nrc")(10), width = 6, height = 6) #颜色向量，pdf文件宽与高
myupset(input = ".miR.txt", database = "recommend", offset = 2, 
        #默认为能取到交集的最大数据库数量，而数量较少，所以设置offset一参数减少数据库数量
        #也可手动选择，格式同上myvenn()
        width = 9, height = 6, #pdf文件宽与高，下为upset绘图函数参数
        nintersects = 50, number.angles = 20, line.size = 0.8, point.size = 2, 
        #分别为展示交集的列数，数字角度，线粗细与点大小
        order.by = "freq", show.numbers = "yes", matrix.color = "grey25", 
        #按数量排序，显示交集的具体数量，线和点的颜色
        sets.x.label = "\nDatabase Prediction", mainbar.y.label = "Gene Intersections")
        #x轴与y轴标题
mynetwork(input = ".miR.txt", selection = "result", degree_cut = 0)
          #selection：result-wheremytargets结果，intersect_v-myvenn结果,intersect_u-myupset结果
          #degree_cut为degree阈值，0即为不过滤，1即为将出现次数为1的节点去除