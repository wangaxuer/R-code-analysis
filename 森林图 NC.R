
install.packages("forestplot")
library(forestplot)
library(readxl)
dat<-read_excel("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\EC文章\\森林图\\EC森林图 随访全 Time\\后代吸烟与孕期吸烟.xlsx", col_names = F,)
forestplot(as.matrix(dat[,1:4]), dat$...5, dat$...6, dat$...7, zero = 1, clip = c(0.4,15), graph.pos = 2, xticks = c(0.2,0.4,0.6,0.8,1,1.2,1.4), boxsize=0.2, xlog=FALSE,
           hrzl_lines = T, col=fpColors(box = "darkblue",lines = "blue"),
           is.summary=c(TRUE,rep(FALSE,20),TRUE), )

fp_add_header("Group")
return()
help("forestplot")

library(forestplot)
library(readxl)

# 读取数据
dat <- read_excel("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\EC文章\\森林图\\EC森林图 随访全 Time\\后代吸烟与孕期吸烟.xlsx", col_names = F)


library(forestplot)
library(readxl)

# 读取数据
dat <- read_excel("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\EC文章\\森林图\\EC森林图 随访全 Time\\EC三个分开死亡.xlsx", col_names = F)

# 生成森林图
forestplot(
  labeltext = as.matrix(dat[, 1:4]),       # 标签文本（数据框的前四列）
  mean = dat$...5,                         # 每个组的平均值（Hazard ratio, HR）
  lower = dat$...6,                        # 置信区间下限
  upper = dat$...7,                        # 置信区间上限
  zero = 1,                                # 零点位置，HR为1时为基线
  clip = c(0.4, 15),                       # 限制x轴范围
  graph.pos = 2,                           # 图例的位置
  xticks = c(0.6, 1,1.4,1.8,2.2,2.4), # x轴刻度
  boxsize = 0.2,                           # 框的大小
  xlog = FALSE,                            # 不使用对数轴
  hrzl_lines = TRUE,                       # 添加水平线
  col = fpColors(box = "darkblue", lines = "darkblue"), # 设置颜色
  is.summary = c(TRUE, rep(FALSE, 20), TRUE), # 汇总行
  
  lwd.ci = 2                              # 设置95%置信区间线条的粗细
)

# 添加标题（可选）
fp_add_header("Group")

return()

