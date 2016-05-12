﻿using System;

namespace Hermes.WebApi.Security.Models
{
    /// <summary>
    /// User authentication token.
    /// </summary>
    public class UserAuthToken
    {
        /// <summary>
        /// The access token
        /// </summary>
        private string accessToken = string.Empty;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserAuthToken"/> class.
        /// </summary>
        /// <param name="accessToken">The access token.</param>
        public UserAuthToken(string accessToken)
        {
            this.accessToken = accessToken;
        }

        /// <summary>
        /// Gets or sets the user authentication token identifier.
        /// </summary>
        /// <value>
        /// The user authentication token identifier.
        /// </value>
        public long UserAuthTokenId { get; set; }

        /// <summary>
        /// Gets or sets the user identifier.
        /// </summary>
        /// <value>
        /// The user identifier.
        /// </value>
        public long UserId { get; set; }

        /// <summary>
        /// Gets or sets the authentication client identifier.
        /// </summary>
        /// <value>
        /// The authentication client identifier.
        /// </value>
        public string AuthClientId { get; set; }

        /// <summary>
        /// Gets or sets the issued UTC.
        /// </summary>
        /// <value>
        /// The issued UTC.
        /// </value>
        public DateTime IssuedUtc { get; set; }

        /// <summary>
        /// Gets or sets the expires UTC.
        /// </summary>
        /// <value>
        /// The expires UTC.
        /// </value>
        public DateTime ExpiresUtc { get; set; }

        /// <summary>
        /// Gets the access token.
        /// </summary>
        /// <value>
        /// The access token.
        /// </value>
        public string AccessToken
        {
            get
            {
                return SecureString.Encrypt(this.accessToken);
            }

            private set
            {
                this.accessToken = value;
            }
        }

        /// <summary>
        /// Gets the decoded access token.
        /// </summary>
        /// <value>
        /// The decoded access token.
        /// </value>
        public string DecodedAccessToken
        {
            get
            {
                return SecureString.Decrypt(this.AccessToken);
            }
        }

        /// <summary>
        /// Gets or sets the created date.
        /// </summary>
        /// <value>
        /// The created date.
        /// </value>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Gets or sets the updated date.
        /// </summary>
        /// <value>
        /// The updated date.
        /// </value>
        public DateTime UpdatedDate { get; set; }
    }
}