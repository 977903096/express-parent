package com.cwj.express.common.model.response;

import lombok.ToString;

/**
 * @author swj
 * todo 错误码待整理
 */

@ToString
public enum CommonCode implements ResultCode{
    DATE_SELECT_ERROR(false, -9999, "日期选择错误"),

    INVALID_PARAM(false,10003,"非法参数！"),
    INVALID_TEL(false,10004,"非法手机号！"),
    SEND_SMS_FAIL(false,10005,"发送验证码失败！"),
    SMS_CODE_FAIL(false,10005,"验证码不正确！"),
    SMS_CODE_TIMEOUT(false,10006,"验证码已过期！"),
    SUCCESS(true,10000,"操作成功！"),
    FAIL(false,11111,"操作失败！"),
    UNAUTHENTICATED(false,10001,"此操作需要登陆系统！"),
    UNAUTHORISE(false,10002,"权限不足，无权操作！"),
    SERVER_ERROR(false,99999,"抱歉，系统繁忙，请稍后重试！"),

    AUTH_FALL(false, 23022, "未登录或token失效"),
    PERMISSION_FALL(false, 23033, "您没有访问权限"),
    AUTH_USERNAME_NONE(false,23001,"请输入账号！"),
    AUTH_PASSWORD_NONE(false,23002,"请输入密码！"),
    AUTH_FACEDATA_NONE(false,23009,"没有读取到人脸数据！"),
    AUTH_PHONE_NOEXIST(false,23010,"该手记号未注册！"),
    AUTH_VERIFYCODE_NONE(false,23003,"请输入验证码！"),
    AUTH_ACCOUNT_NOTEXISTS(false,23004,"账号不存在！"),
    AUTH_CREDENTIAL_ERROR(false,23005,"账号或密码错误！"),
    AUTH_LOGIN_ERROR(false,23006,"登陆过程出现异常请尝试重新操作！"),
    AUTH_LOGIN_APPLYTOKEN_FAIL(false,23007,"账号或密码错误！"),
    AUTH_LOGIN_TOKEN_SAVEFAIL(false,23008,"存储令牌失败！"),
    AUTH_NOT_MATCH_FACE(false, 23009, "未找到匹配的人脸数据"),
    AUTH_NOT_DETECT_FACE(false,23010, "未检测到人脸数据，请调整周围环境重试"),
    AUTH_NOT_REAL_FACE(false, 23011, "请使用真实人脸数据录入系统"),
    AUTH_FACE_ANGEL_BAD(false, 23012, "请摆正人脸，不要歪斜"),
    AUTH_FACE_COMPLETENESS_BAD(false, 23013, "请将整个脸置于摄像框内"),
    AUTH_FACE_BLUR_BAD(false, 23014, "人脸数据太模糊，请重试"),
    AUTH_FACE_EYE_OCCLUSION_BAD(false, 23015, "请不要遮挡眼睛"),
    AUTH_FACE_NOSE_OCCLUSION_BAD(false, 23016, "请不要遮挡鼻子"),
    AUTH_FACE_MOUTH_OCCLUSION_BAD(false, 23017, "请不要遮挡嘴巴"),
    AUTH_FACE_CHEEK_OCCLUSION_BAD(false, 23018, "请不要遮挡脸颊"),
    AUTH_FACE_CHIN_OCCLUSION_BAD(false, 23019, "请不要遮挡下巴"),
    AUTH_FACE_ILLUMINATION_BAD(false, 23020, "光照太差，请调整光源后重试"),
    AUTH_NOT_ACCORD_WITH_MIN_REQUIREMENT(false, 23021, "人脸数据不符合匹配要求，请调整环境重试"),

    AREA_NOT_FOUND(false, 30001, "该id的行政区不存在!"),
    AREA_COMPANY_NOT_FOUND(false, 30002, "该id的公司不存在！"),
    AREA_SCHOOL_NOT_FOUND(false, 30003, "属于该id行政区的学校不存在！"),


    ORDER_NOT_EXIST_ERROR(false, 40001, "订单不存在！"),
    PAYMENT_NOT_EXIST_ERROR(false, 40002, "订单支付信息不存在！"),
    ORDER_HAS_BEEN_CHANGEED(false, 40003, "订单状态更新失败！有可能是订单状态已被改变！"),
    ORDER_COUNT_NOT_EQ(false, 40004, "存在不能更新状态的订单！"),
    ORDER_CAN_NOT_EVALUATE(false, 40005, "该订单不能评价！需完成状态"),
    ORDER_EVALUATE_EXIST(false, 40006, "订单已评价！"),


    ALI_PAY_GATEWAY_ERROR(false, 50001, "支付宝接口调用失败！"),
    ALI_PAY_SIGN_ERROR(false, 50002, "支付宝签证验证失败！"),

    COURIER_NOT_EXIST(false, 60001, "该区域没有配送员！"),


    COURIER_LEAVE_FALL(false, 70001, "配送员请假失败！"),
    COURIER_REWORK_FAIL(false, 70002, "配送员回到岗位操作失败！"),
    COURIER_SIGN_NORMAL_EXIST(false, 70003, "配送员今日已日常签到！"),
    COURIER_NOT_SIGN_NORMAL(false, 70004, "配送员还未进行日常签到"),
    COURIER_SIGN_DATA_CHANGED(false, 70005, "签到失败！签到数据可能发生变化！"),
    COURIER_SIGNOT_TIME_ERROER(false, 70006, "非加班签到时间！"),
    COURIER_SINGOT_EXIST(false, 70007, "加班签到记录已存在！"),
    COURIER_SIGN_NOTMAL_NOT_EXIST(false, 70008, "尚未进行普通签到！"),
    LEAVE_STATUS_CAN_NOT_SIGN(false, 70009, "请假状态无法签到"),
    EVALUATE_UPDATE_RETRY(false, 70010, "分数状态更新失败！待消息重试！"),


    ;
//    private static ImmutableMap<Integer, CommonCode> codes ;
    //操作是否成功
    boolean success;
    //操作代码
    int code;
    //提示信息
    String message;
    private CommonCode(boolean success,int code, String message){
        this.success = success;
        this.code = code;
        this.message = message;
    }

    @Override
    public boolean success() {
        return success;
    }
    @Override
    public int code() {
        return code;
    }

    @Override
    public String message() {
        return message;
    }


}
