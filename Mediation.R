install.packages("mediation")
library(mediation)
library(readxl)
data<-read_xlsx("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\EC文章\\原始数据\\食管癌母乳炎细胞中介\\食管癌 母乳 白细胞 排基线.xlsx")
df<-data


# 假设数据已存储在 df 数据框中
# df <- read.csv("path_to_your_data.csv") # 示例数据加载步骤

# 拟合中介模型
med.fit <- lm(WBC ~ 母乳喂养 + sex + age + race + BMI + 吸烟和不吸烟 + drink + MET + TDI + 癌症家族史 + income + 少睡失眠, data = df)

# 拟合结果模型（使用逻辑回归）
out.fit <- glm(诊断为食管癌 ~ WBC + 母乳喂养 + sex + age + race + BMI + 吸烟和不吸烟 + drink + MET + TDI + 癌症家族史 + income + 少睡失眠, 
               data = df, family = binomial())

# 使用中介分析
med.out <- mediate(med.fit, out.fit, treat = "母乳喂养", mediator = "WBC", boot = FALSE, sims = 500)

# 总结结果
summary(med.out)




