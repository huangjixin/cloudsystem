mvn clean package -Dmaven.test.skip=true mybatis-generator:generator 

在service层中调用
int page = 1;
int size = 5;
PageHelper.startPage(page,size);    //只生效一次。做两次sql查询，总数查询一次，分页查询一次
List<User> users =  userMapper.findAll();
PageInfo<User> pageInfo = new PageInfo<User>(users);