install.packages("mediation")
library(mediation)
library(readxl)
data<-read_xlsx("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\.xlsx")
df<-data


# 假设数据已存储在 df 数据框中
# df <- read.csv("path_to_your_data.csv") # 示例数据加载步骤

# 拟合中介模型
med.fit <- lm(WBC ~ breastfeedig + sex + age + race + BMI + smoke + drink + MET + TDI + history + income +  insomnia, data = df)

# 拟合结果模型（使用逻辑回归）
out.fit <- glm(cancer ~ WBC + breastfeeding + sex + age + race + BMI + smoke + drink + MET + TDI + history + income +  insomnia, 
               data = df, family = binomial())

# 使用中介分析
med.out <- mediate(med.fit, out.fit, treat = "breastfeeding", mediator = "WBC", boot = FALSE, sims = 500)

# 总结结果
summary(med.out)




