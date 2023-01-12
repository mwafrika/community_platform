# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create!([
               { name: 'Star Wars', email: 'user1@gmail.com', password: '123456' },
               { name: 'mwafrika', email: 'user2@gmail.com', password: '123456' },
               { name: 'john', email: 'user3@gmail.com', password: '123456' },
               { name: 'kasanga', email: 'user4@gmail.com', password: '123456' },
               { name: 'Star', email: 'user5@gmail.com', password: '123456' },
               { name: 'john', email: 'user6@gmail.com', password: '123456' },
               { name: 'jeanvier', email: 'user7@gmail.com', password: '123456' },
               { name: 'kisole', email: 'user8@gmail.com', password: '123456' }
             ])

Group.create!([
                { name: 'Star Wars', description: 'Welcome nbro' },
                { name: 'mwafrika', description: 'Nice' },
                { name: 'john', description: 'Good', description: '123456' },
                { name: 'kasanga', description: 'Welcome again' }
              ])

Post.create!([{
               title: 'First post', body: 'Welcome nbro', user_id: User.first.id, group_id: Group.first.id
             },
              { title: 'Second post', body: 'Welcome nbro', user_id: User.second.id, group_id: Group.first.id }, {
                title: 'Welcome here', body: 'Welcome nbro', user_id: User.first.id, group_id: Group.second.id
              }, {
                title: 'Good', body: 'Welcome nbro', user_id: User.last.id, group_id: Group.first.id
              }])

Comment.create!([
                  {
                    body: 'Nice post', user_id: User.second.id, post_id: Post.second.id, parent_id: Comment.first.id
                  },
                  {
                    body: 'Good post', user_id: User.second.id, post_id: Post.second.id, parent_id: Comment.first.id
                  },
                  {
                    body: 'Nice post3', user_id: User.second.id, post_id: Post.second.id, parent_id: Comment.second.id
                  },
                  {
                    body: 'Nice post4', user_id: User.third.id, post_id: Post.first.id, parent_id: Comment.first.id
                  }
                ])

Reply.create!([
                {
                  body: 'Nice post', user_id: User.second.id, comment_id: Comment.second.id
                },
                {
                  body: 'Good post', user_id: User.second.id, comment_id: Comment.second.id
                },
                {
                  body: 'Nice post3', user_id: User.second.id, comment_id: Comment.second.id
                },
                {
                  body: 'Nice post4', user_id: User.third.id, comment_id: Comment.first.id
                }
              ])
