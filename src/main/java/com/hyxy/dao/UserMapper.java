package com.hyxy.dao;

import com.hyxy.entity.User;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	User login(Map<String, String> map);

	Set<String> getPermissions(String userName);

	User getByUserName(String string);

	Set<String> getRoles(String userName);
}