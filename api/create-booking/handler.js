const AWS = require("aws-sdk");
const uuidv4 = require("uuid/v4");

AWS.config.update({
  region: process.env.AWS_REGION
});

const documentClient = new AWS.DynamoDB.DocumentClient();

module.exports.create = async event => {
  const body = JSON.parse(event.body);
  await documentClient
    .put({
      TableName: process.env.DYNAMODB_BOOKINGS,
      Item: {
        id: uuidv4(),
        date: body.date,
        user: event.requestContext.authorizer
      }
    })
    .promise();

  return {
    statusCode: 200,
    body: JSON.stringify({ message: "Agendamento efetuado com sucesso." })
  };
};
