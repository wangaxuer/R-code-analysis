library(ggplot2)
library(rms)
library(survminer)
library(survival)
EC<-read_excel("D:\\HuaweiMoveData\\Users\\86180\\Desktop\\.xlsx")
head(EC)
dd <- datadist(EC)
options(datadist='dd')
for(knot in 3:10)
  fit <- cph(Surv(time,cancer)~rcs(CRP,5) + sex + age + race + BMI + smoke + drink + MET + TDI + history + income + insomnia, X=TRUE,y=TRUE,data=EC)
             tmp<- extractAIC(fit)
             if(knot==5){AIC=tmp[2];nk=5}
            
fit <-cph(Surv(time,cancer)~rcs(CRP,5)+ sex + age + race + BMI + smoke + drink + MET + TDI + history + income + insomnia,X=TRUE,y=TRUE,data=EC)

anova(fit)

# 获取卡方统计量和自由度
chi_sq <- 569.36
df <- 15

# 使用卡方分布计算P值
p_value <- pchisq(chi_sq, df, lower.tail = FALSE)

# 打印精确的P值
print(p_value, digits = 10)


HR<-Predict(fit,CRP,fun=exp)
head(HR)
write.csv(HR, file = "D:\\HuaweiMoveData\\Users\\86180\\Desktop\\RCS CRP incidence.csv", row.names = FALSE)

ggplot()+
  geom_line(data=HR,aes(CRP,yhat),
            linetype="solid",size=2,alpha = 10.0,colour="#a7b9d7")+
        geom_ribbon(data=HR,
                   aes(CRP,ymin =lower,ymax=upper),
                   alpha = 0.4,fill="#a7b9d7")+
  theme_classic()+
  geom_hline(yintercept=1,linetype=2,size=1)+
  labs(title ="for lung cancer Mortality",x="WBC",y="HR(95%CI)")


