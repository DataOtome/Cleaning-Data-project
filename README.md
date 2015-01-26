因为题目的解释不明,我查询了英文版本课论坛,助教对于本课程项目的提示
>**what columns are measurements on the mean and standard deviation**

>Based on column names in the features is an open question as to is the the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well. There are no specific marking critieria on the number of columns. It is up to you to make a decision and explain what you did to the data. Make it easy for people to give you marks by explaining your reasoning.

所以说我只需要选择我认为的什么是"测量"就好了

假如不用经过处理后得到的最终数据,不就等于让数据收集者之前的处理努力都白费了吗?再加上处理后的数据能更好的反应问题的本质,所以我决定取原始数据经处理后最终得到的数据为"测量"

根据features_info文件说明, fBodyAcc-XYZ是经过处理得到的最终加速度数据, fBodyGyro-XYZ为经过处理得到的最终陀螺仪数据.

查询features文件可知

        266 fBodyAcc-mean()-X
        267 fBodyAcc-mean()-Y
        268 fBodyAcc-mean()-Z
        269 fBodyAcc-std()-X
        270 fBodyAcc-std()-Y
        271 fBodyAcc-std()-Z
        424 fBodyGyro-mean()-X
        425 fBodyGyro-mean()-Y
        426 fBodyGyro-mean()-Z
        427 fBodyGyro-std()-X
        428 fBodyGyro-std()-Y
        429 fBodyGyro-std()-Z
    
由此得到我所需数据的列序号

我从X_train和X_test中提取所需的加速器和陀螺仪测量均值,标准差,再加上从y_train,y_test中得到的活动种类编号转换为名称,与subject_train,subject_test中的被试者id通过列合并结合在一起,组成我的第一个整洁数据集tidy_data

_(至此第4步完成)_

---

第5步,翻译害死人" for each activity and each subject."应该翻译成每个活动和每个被试者.我在评审别人作业时发现有人把这题理解错,所以特地过来补上这句说明
题目要求问的太有歧义了,3个两两牵制的变量怎么做成一个二维表(鉴于我们还没接触到多维),所以我查询助教的帖子说

>Doesn't matter, you are being asked to produce a average for each combination of >subject, activity, and variable as a sign you can manipulate the data.

既然他说问题是什么不重要,只要展示我有处理数据的能力就行,那我就假定他是想要我的数据能反映出每个变量在每个被试的每个活动的平均读数

我让之前生成的整洁数据集tidy_data,以受试者编号+活动类型为factor,分割tidy_data,得到的小块用colMeans求列的平均值,最终得到一个纵向压缩版的tidy_data,起名为tidy_data2,通过对受试者编号排序后,输出为"tidy_data2.txt"