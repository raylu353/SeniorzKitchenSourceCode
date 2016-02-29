/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ray
 */
@Entity
@Table(name = "comments")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comments.findAll", query = "SELECT c FROM Comments c"),
    @NamedQuery(name = "Comments.findByCommentID", query = "SELECT c FROM Comments c WHERE c.commentID = :commentID"),
    @NamedQuery(name = "Comments.findByCommentDatetime", query = "SELECT c FROM Comments c WHERE c.commentDatetime = :commentDatetime"),
    @NamedQuery(name = "Comments.findByCommentuserID", query = "SELECT c FROM Comments c WHERE c.commentuserID = :commentuserID"),
    @NamedQuery(name = "Comments.findByCommentrecipeID", query = "SELECT c FROM Comments c WHERE c.commentrecipeID = :commentrecipeID")})
public class Comments implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "comment_ID")
    private Long commentID;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "comment_content")
    private String commentContent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comment_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date commentDatetime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comment_user_ID")
    private long commentuserID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comment_recipe_ID")
    private long commentrecipeID;

    public Comments() {
    }

    public Comments(Long commentID) {
        this.commentID = commentID;
    }

    public Comments(Long commentID, String commentContent, Date commentDatetime, long commentuserID, long commentrecipeID) {
        this.commentID = commentID;
        this.commentContent = commentContent;
        this.commentDatetime = commentDatetime;
        this.commentuserID = commentuserID;
        this.commentrecipeID = commentrecipeID;
    }

    public Long getCommentID() {
        return commentID;
    }

    public void setCommentID(Long commentID) {
        this.commentID = commentID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDatetime() {
        return commentDatetime;
    }

    public void setCommentDatetime(Date commentDatetime) {
        this.commentDatetime = commentDatetime;
    }

    public long getCommentuserID() {
        return commentuserID;
    }

    public void setCommentuserID(long commentuserID) {
        this.commentuserID = commentuserID;
    }

    public long getCommentrecipeID() {
        return commentrecipeID;
    }

    public void setCommentrecipeID(long commentrecipeID) {
        this.commentrecipeID = commentrecipeID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commentID != null ? commentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comments)) {
            return false;
        }
        Comments other = (Comments) object;
        if ((this.commentID == null && other.commentID != null) || (this.commentID != null && !this.commentID.equals(other.commentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.Comments[ commentID=" + commentID + " ]";
    }
    
}
