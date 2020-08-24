package com.bb.dao;

import com.bb.domain.Cat;
import com.bb.domain.Evaluation;
import com.bb.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EvaluationDao {
    public List<Evaluation> findById(Integer id) {   //to find all information of cat table
        ArrayList<Evaluation> Evaluations = new ArrayList<Evaluation> ();
        Connection connection = DBUtil.getConnectDb();
        String sql = "select user.username, evaluation.content from evaluation, user where evaluation.userId=user.id and evaluation.employeeId="+id;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Evaluation evaluation = new Evaluation();
                evaluation.setUserName(rs.getString("username"));
                evaluation.setContent(rs.getString("content"));
                Evaluations.add(evaluation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs,stm,connection);
        }
        return Evaluations;
    }

}
