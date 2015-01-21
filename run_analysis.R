#读入原始测试数据
linename = t(read.table("features.txt")[2])
test = read.table("test/X_test.txt", col.names = linename, check.names = F)
train = read.table("train/X_train.txt", col.names = linename, check.names = F)
act_name = as.character(read.table("activity_labels.txt")[[2]])
#读入原始受试者和活动数据
tester = read.table("test/subject_test.txt", col.names = "tester")
tester[1] <- factor(tester[[1]])
test_activity = read.table("test/y_test.txt",col.names = "activity")
test_activity[1] <- factor(test_activity[[1]], labels = act_name)

trainer = read.table("train/subject_train.txt", col.names = "tester")
trainer[1] <- factor(trainer[[1]])
train_activity = read.table("train/y_train.txt",col.names = "activity")
train_activity[1] <- factor(train_activity[[1]], labels = act_name)
#原始数据准备完毕
#提取并合并原始数据
subtest = cbind(test[266:271], test[424:429], test_activity, tester, data_from="test")
subtrain = cbind(train[266:271], train[424:429], train_activity, trainer, data_from="train")
#生成步骤4的整洁数据
tidy_data = rbind(subtest, subtrain)

library("plyr")
#生成步骤5的整洁数据2
tidy_data2 = ddply(tidy_data, .(tester,activity, data_from),
                   function(x) colMeans(x[1:12]))
#排序一下
tidy_data2 = arrange(tidy_data2, as.numeric(as.character(tidy_data2$tester)))

#输出
write.table(tidy_data2, 'tidy_data2.txt') 
#检查输出
#cheak = read.table('tidy_data2.txt',check.names = F)

