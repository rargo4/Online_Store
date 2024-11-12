namespace OnlineStore.User
{
    public class UserManager
    {
        public bool CreateUser(string username, string password)
        {
            //create user object
            User user = new User
            {
                Username = username,
                Password = password
            };
            //call method SaveUser from Accessor to save the user and return result
            return UserAccessor.SaveUser(user);
        }
        //check if username and password are correct
        public bool AuthenticateUser(string username, string password)
        {
            //retrieve the user object using accessor with the username
            User user = UserAccessor.GetUserByUsername(username);
            //if user not found return false
            if(user == null)
            {
                return false;
            }
            //check if passwords match
            return user.Password == password;
        }
    }
}