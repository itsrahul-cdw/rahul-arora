##############################################################################################################################################
##    PLEASE ADD BELOW PERMISSIONS TO IAM ROLE ATTACHED TO THE ON-PREMISE INSTANCE AS A PRE-REQUISITVE                                      ##
##              ssm:DescribeParameters                                                                                                      ##
##              tag:GetResources                                                                                                            ##
##############################################################################################################################################
#!/bin/bash


echo "........... Initiating the execution ............".

all_ps_values=$(aws ssm describe-parameters --parameter-filters "Key=tag:Project,Values=Liveline" --query Parameters[*].Name)
#echo $all_ps_values

for ps in $all_ps_values
do
        if [[ "$ps" == *user1/accesskey* ]]
        then
                echo "........... Reading access key from parameter: $ps"
                user1_access_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user1_access_key

                echo "....... Replacing access key from parameter ...........: $ps"
                cat ~/.aws/credentials_1
                sed -i -r -e "s:^(aws_access_key_id =).*:\1 $user1_access_key:" ~/.aws/credentials_1
                cat ~/.aws/credentials_1
                sleep 3

        elif [[ "$ps" == *user1/secretkey* ]]
        then
                echo "........... Reading secret key from parameter: $ps"
                user1_secret_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user1_secret_key

                echo "....... Replacing secret key from parameter ...........: $ps"
                cat ~/.aws/credentials_1
                sed -i -r -e "s:^(aws_secret_access_key =).*:\1 $user1_secret_key:" ~/.aws/credentials_1
                cat ~/.aws/credentials_1
                sleep 3

        elif [[ "$ps" == *user2/accesskey* ]]
        then
                echo "........... Reading access key from parameter: $ps"
                user2_access_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user2_access_key

                echo "....... Replacing access key from parameter ...........: $ps"
                cat ~/.aws/credentials_2
                sed -i -r -e "s:^(aws_access_key_id =).*:\1 $user2_access_key:" ~/.aws/credentials_2
                cat ~/.aws/credentials_2
                sleep 3

        elif [[ "$ps" == *user2/secretkey* ]]
        then
                echo "........... Reading secret key from parameter: $ps"
                user2_secret_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user2_secret_key

                echo "....... Replacing secret key from parameter ...........: $ps"
                cat ~/.aws/credentials_2
                sed -i -r -e "s:^(aws_secret_access_key =).*:\1 $user2_secret_key:" ~/.aws/credentials_2
                cat ~/.aws/credentials_2
                sleep 3


        elif [[ "$ps" == *user3/accesskey* ]]
        then
                echo "........... Reading access key from parameter: $ps"
                user3_access_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user3_access_key

                echo "....... Replacing access key from parameter ...........: $ps"
                cat ~/.aws/credentials_3
                sed -i -r -e "s:^(aws_access_key_id =).*:\1 $user3_access_key:" ~/.aws/credentials_3
                cat ~/.aws/credentials_3
                sleep 3

        elif [[ "$ps" == *user3/secretkey* ]]
        then
                echo "........... Reading secret key from parameter: $ps"
                user3_secret_key=$(aws ssm get-parameter --name $ps --with-decryption --output text --query Parameter.Value)
                echo $user3_secret_key

                echo "....... Replacing secret key from parameter ...........: $ps"
                cat ~/.aws/credentials_3
                sed -i -r -e "s:^(aws_secret_access_key =).*:\1 $user3_secret_key:" ~/.aws/credentials_3
                cat ~/.aws/credentials_3
                sleep 3

        else
                continue

        fi


done

echo ".................. Script Execution is Completed ................."