package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.entity.IUser;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * I茅台用户Mapper接口
 *
 * @author oddfar
 * @date 2023-07-02
 */
public interface IUserMapper extends BaseMapperX<IUser> {
    default PageResult<IUser> selectPage(IUser iUser) {

        return selectPage(new LambdaQueryWrapperX<IUser>()
                .eqIfPresent(IUser::getUserId, iUser.getUserId())
                .eqIfPresent(IUser::getMobile, iUser.getMobile())
                .eqIfPresent(IUser::getProvinceName, iUser.getProvinceName())
                .betweenIfPresent(IUser::getExpireTime, iUser.getParams())
                .orderByAsc(IUser::getCreateTime)
        );

    }

    default PageResult<IUser> selectPage(IUser iUser, Long userId) {

        return selectPage(new LambdaQueryWrapperX<IUser>()
                .eqIfPresent(IUser::getUserId, iUser.getUserId())
                .eqIfPresent(IUser::getMobile, iUser.getMobile())
                .eqIfPresent(IUser::getProvinceName, iUser.getProvinceName())
                .eq(IUser::getCreateUser, userId)
                .betweenIfPresent(IUser::getExpireTime, iUser.getParams())
                .orderByAsc(IUser::getCreateTime)
        );

    }

    default List<IUser> selectReservationUser() {
        return selectList(new LambdaQueryWrapperX<IUser>()
//                      .gt(IUser::getExpireTime, new Date())
                        .ne(IUser::getLat, "")
                        .ne(IUser::getLng, "")
                        .ne(IUser::getItemCode, "")
                        .isNotNull(IUser::getItemCode)

        );

    }

    /**
     * 查询token3天内过期的用户
     * @return
     */
    default List<IUser> selectExpireTimeUser() {
        LocalDateTime threeDaysLater = LocalDateTime.now().plusDays(3);
        Date threeDaysLaterDate = Date.from(threeDaysLater.atZone(ZoneId.systemDefault()).toInstant());

        LocalDateTime currentDate = LocalDateTime.now();
        Date currentDateDate = Date.from(currentDate.atZone(ZoneId.systemDefault()).toInstant());


        return selectList(new LambdaQueryWrapperX<IUser>()
                .between(IUser::getExpireTime, currentDateDate, threeDaysLaterDate)
        );

    }

    /**
     * 通过预约执行分钟查询预约用户列表
     */
    default List<IUser> selectReservationUserByMinute(int minute) {
        return selectList(new LambdaQueryWrapperX<IUser>()
                        .eq(IUser::getMinute, minute)
//                      .gt(IUser::getExpireTime, new Date())
                        .ne(IUser::getLat, "")
                        .ne(IUser::getLng, "")
                        .ne(IUser::getItemCode, "")
                        .isNotNull(IUser::getItemCode)
        );
    }

    @Select("UPDATE i_user SET `minute` = (SELECT FLOOR(RAND() * 50 + 1)) WHERE random_minute = \"0\"")
    void updateUserMinuteBatch();

    int deleteIUser(Long[] iUserId);
}
