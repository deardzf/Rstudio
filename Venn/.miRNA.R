#R包安装
for (i in c("ggsci", "venn", "dplyr", "data.table")) {
  if (!requireNamespace(i, quietly = TRUE)) {
    install.packages(i, update = FALSE)
  }
};rm(i)

source('./data/.venn_P+.R')

#已设置默认参数，直接运行函数即可
wheremytargets()
hereiam()
mynetwork()

#参数
wheremytargets(input = ".miR.txt", mycol = pal_npg("nrc")(10), #颜色向量
               database = c("ENCORI", "miRDB", "miRWalk", "RNA22",
                            "RNAInter", "TargetMiner", "TargetScan")) #数据库，名字请对应
hereiam(input = ".miR.txt", mycol = pal_npg("nrc")(10), nub = 1, #输出文件的末尾序号
        database = c("miRWalk", "RNA22", "RNAInter", "TargetScan"))
mynetwork(input = ".miR.txt", selection = "frist", 
          #“frist”即为wheremytargets的结果，否则为hereiam的结果
          degree_cut = 0) #degree阈值，0即为不过滤，1即为将出现次数为1的节点去除
