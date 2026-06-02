//
//  UserModel.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

@interface UserModel : NSObject

@property (nonatomic, strong, readonly) NSDictionary *dictionaryRepresentation;
@property (nonatomic, assign, readonly) NSString     *userID;
@property (nonatomic, strong, readonly) NSString     *username;
@property (nonatomic, strong, readonly) NSString     *firstName;
@property (nonatomic, strong, readonly) NSString     *lastName;
@property (nonatomic, strong, readonly) NSString     *fullName;
@property (nonatomic, strong, readonly) NSString     *location;
@property (nonatomic, strong, readonly) NSString     *about;
@property (nonatomic, strong, readonly) NSURL        *userPicURL;
@property (nonatomic, assign, readonly) NSUInteger   photoCount;
@property (nonatomic, assign, readonly) NSUInteger   galleriesCount;
@property (nonatomic, assign, readonly) NSUInteger   affection;
@property (nonatomic, assign, readonly) NSUInteger   friendsCount;
@property (nonatomic, assign, readonly) NSUInteger   followersCount;
@property (nonatomic, assign, readonly) BOOL         following;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithUnsplashPhoto:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

- (NSAttributedString *)usernameAttributedStringWithFontSize:(CGFloat)size;
- (NSAttributedString *)fullNameAttributedStringWithFontSize:(CGFloat)size;

- (void)fetchAvatarImageWithCompletionBlock:(void(^)(UserModel *, UIImage *))block;

- (void)downloadCompleteUserDataWithCompletionBlock:(void(^)(UserModel *))block;

@end
