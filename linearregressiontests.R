cardiacfit <- lm(F3_full_sheet$Wait ~ F3_full_sheet$CardiacCount)
summary(cardiacfit)
pediatricfit <- lm(F3_full_sheet$Wait ~ F3_full_sheet$PediatricCount)
summary(pediatricfit)

F3_pediatricwait <- F3_full_sheet[F3_full_sheet$PediatricCount!=0,]
onlypediatricfit <- lm(F3_pediatricwait$Wait ~ F3_pediatricwait$PediatricCount)
summary(onlypediatricfit)

F3_pedcardwait <- F3_full_sheet[(F3_full_sheet$PediatricCount+F3_full_sheet$CardiacCount)!=0, c("Wait","PediatricCount","CardiacCount")]
F3_pedcardwait$pedcardsum <- F3_pedcardwait$PediatricCount+F3_pedcardwait$CardiacCount
pedcardfit <- lm(F3_pedcardwait$Wait ~ F3_pedcardwait$pedcardsum)
summary(pedcardfit)