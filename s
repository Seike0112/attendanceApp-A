
[1mFrom:[0m /home/ec2-user/environment/attendanceApp-A/app/controllers/attendances_controller.rb @ line 66 AttendancesController#overtime_application:

    [1;34m63[0m: [32mdef[0m [1;34movertime_application[0m
    [1;34m64[0m:   @user = [1;34;4mUser[0m.find(params[[33m:user_id[0m])
    [1;34m65[0m:   @attendance = [1;34;4mAttendance[0m.find(params[[33m:attendance_id[0m])
 => [1;34m66[0m:   binding.pry
    [1;34m67[0m:   check_judge
    [1;34m68[0m:   [32mif[0m @attendance.update_attributes(overtime_params)
    [1;34m69[0m: 
    [1;34m70[0m:     flash[[33m:success[0m] = [31m[1;31m"[0m[31m残業情報を更新しました。[1;31m"[0m[31m[0m
    [1;34m71[0m:     
    [1;34m72[0m:     redirect_to @user
    [1;34m73[0m:   [32melse[0m
    [1;34m74[0m:     flash[[33m:danger[0m] = [31m[1;31m"[0m[31m残業情報を更新できませんでした。[1;31m"[0m[31m[0m
    [1;34m75[0m:     render [33m:show[0m
    [1;34m76[0m:   [32mend[0m
    [1;34m77[0m: [32mend[0m

