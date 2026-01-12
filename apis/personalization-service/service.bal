import ballerina/http;

UserInfoResolver userInfoResolver = new;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"]
    }
}
service / on new http:Listener(9093) {

    resource function get personalization/org/[string orgId](http:Headers headers) returns Personalization|http:NotFound|error? {

        return getPersonalization(orgId);
    }

    @http:ResourceConfig {
        auth: {
            scopes: "create_basic_branding"
        }
    }
    resource function post personalization(http:Headers headers, @http:Payload Personalization newPersonalization) returns Personalization|error? {

        UserInfo|error userInfo = userInfoResolver.retrieveUserInfo(headers);
        if userInfo is error {
            return userInfo;
        }

        Personalization|error personalization = updatePersonalization(userInfo.organization, newPersonalization);
        return personalization;
    }

    @http:ResourceConfig {
        auth: {
            scopes: "delete_branding"
        }
    }
    resource function delete personalization(http:Headers headers) returns http:NoContent|http:NotFound|error? {

        UserInfo|error userInfo = userInfoResolver.retrieveUserInfo(headers);
        if userInfo is error {
            return userInfo;
        }

        string|()|error result = deletePersonalization(userInfo.organization);

        if result is () {
            return http:NOT_FOUND;
        } else if result is error {
            return result;
        }
        return http:NO_CONTENT;
    }

    # Test the personalization service
    # + return - status message indicating the service is running
    resource function get personalization/test() returns http:Response {
        
        http:Response res = new;
        res.statusCode = 200;
        res.setTextPayload("Personalization service is up and running!");
        return res;
    }
}
