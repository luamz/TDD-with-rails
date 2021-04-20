describe 'Testing Double' do
  it '--' do
    user = double('User')
    allow(user).to receive_messages(name:"Liam",password: 'secret')
    puts user.name
    puts user.password
  end
end