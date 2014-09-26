    fls = dir('BlogFeedback/blogData_test*.csv');
    for fi=1:numel(fls)
        A{fi} = importdata(strcat('BlogFeedback/', fls(fi).name));
    end